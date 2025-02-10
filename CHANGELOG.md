# Changelog

## [1.0.0] - 2024-03-XX

### Adicionado
- Interface INavigationService para abstração da navegação
- Implementação do NavigationService
- Sistema de permissões baseado em módulos
- Documentação detalhada das alterações em /docs/changes

### Alterado
- Refatoração do NavigationCubit para usar injeção de dependência
- Migração do sistema de navegação de índices para permissões
- Otimização de performance em componentes do drawer
- Melhoria no gerenciamento de estado dos componentes

### Corrigido
- Problema de navegação no drawer
- Uso incorreto de withValues para opacidade
- Memory leaks potenciais em operações assíncronas
- Mapeamento incorreto de rotas nas permissões

### Melhorias Técnicas
- Implementação de princípios SOLID
- Melhor gerenciamento de estado assíncrono
- Otimização de rebuilds
- Adição de keys para melhor performance
- Centralização de constantes de layout

### Documentação
- Adicionada documentação detalhada de mudanças
- Criado índice de alterações
- Documentação de princípios e padrões utilizados